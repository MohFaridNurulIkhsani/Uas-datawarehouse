<?php

/**
 * Created by PhpStorm.
 * User: dimas
 * Date: 23/06/2018
 * Time: 10:50
 */
class saw {

    private $konek;
    private $idCookie;
    public $simpanNormalisasi=array();
    public function setconfig($konek,$idCookie){
        $this->konek=$konek;
        $this->idCookie=$idCookie;
    }
    public function getConnect(){
       return $this->konek;
    }
    //mendapatkan kriteria
    public function getKriteria(){
        $data=array();
        $querykriteria="SELECT namaKriteria FROM kriteria";//query tabel kriteria
        $execute=$this->getConnect()->query($querykriteria);
        while ($row=$execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data,$row['namaKriteria']);
        }
        return $data;
    }
    //mendapatkan alternative
    public function getAlternative(){
        $data=array();
        $queryAlternative="SELECT customer.namacustomer AS namacustomer,id_customer FROM nilai_customer INNER JOIN customer USING(id_customer) WHERE id_jenisbarang='$this->idCookie' GROUP BY id_customer ";
        $execute=$this->getConnect()->query($queryAlternative);
        while ($row=$execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data,array("namacustomer"=>$row['namacustomer'],"id_customer"=>$row['id_customer']));
        }
        return $data;
    }
    public function getNilaiMatriks($id_customer){
        $data=array();
        $queryGetNilai="SELECT nilai_kriteria.nilai AS nilai,kriteria.sifat AS sifat,nilai_customer.id_kriteria AS id_kriteria FROM nilai_customer JOIN kriteria ON kriteria.id_kriteria=nilai_customer.id_kriteria JOIN nilai_kriteria ON nilai_kriteria.id_nilaikriteria=nilai_customer.id_nilaikriteria WHERE (id_jenisbarang='$this->idCookie' AND id_customer='$id_customer')";
        $execute=$this->getConnect()->query($queryGetNilai);
        while ($row=$execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data,array(
                "nilai"=>$row['nilai'],
                "sifat"=>$row['sifat'],
                "id_kriteria"=>$row['id_kriteria']
            ));
        }
        return $data;
    }
    public function getArrayNilai($id_kriteria){
        $data=array();
        $queryGetArrayNilai="SELECT nilai_kriteria.nilai AS nilai FROM nilai_customer INNER JOIN nilai_kriteria ON nilai_customer.id_nilaikriteria=nilai_kriteria.id_nilaikriteria WHERE nilai_customer.id_kriteria='$id_kriteria' AND nilai_customer.id_jenisbarang='$this->idCookie'";
        $execute=$this->getConnect()->query($queryGetArrayNilai);
        while ($row=$execute->fetch_array(MYSQLI_ASSOC)) {
            array_push($data,$row['nilai']);
        }
        return $data;
    }
    //rumus normalisasai
    public function normalisasi($array,$sifat,$nilai){
        if ($sifat=='Benefit'){
            $result=$nilai/max($array);
        }elseif ($sifat=='Cost'){
            $result=min($array)/$nilai;
        }
        return round($result,3);
    }
    //mendapatkan bobot kriteria
    public function getBobot($id_kriteria){
        $queryBobot="SELECT bobot FROM bobot_kriteria WHERE id_jenisbarang='$this->idCookie' AND id_kriteria='$id_kriteria' ";
        $row=$this->getConnect()->query($queryBobot)->fetch_array(MYSQLI_ASSOC);
        return $row['bobot'];
    }
    //meyimpan hasil perhitungan
    public function simpanHasil($id_customer,$hasil){
        $queryCek="SELECT hasil FROM hasil WHERE id_customer='$id_customer' AND id_jenisbarang='$this->idCookie'";
        $execute=$this->getConnect()->query($queryCek);
        if ($execute->num_rows > 0) {
            $querySimpan="UPDATE hasil SET hasil='$hasil' WHERE id_customer='$id_customer' AND id_jenisbarang='$this->idCookie'";
        }else{
            $querySimpan="INSERT INTO hasil(hasil,id_customer,id_jenisbarang) VALUES ('$hasil','$id_customer','$this->idCookie')";
        }
        $execute=$this->getConnect()->query($querySimpan);

    }
    //Kmencari kesimpulan
    public function getHasil(){
    $queryHasil     =   "SELECT hasil.hasil AS hasil,jenis_barang.namaBarang,customer.namacustomer AS namacustomer FROM hasil JOIN jenis_barang ON jenis_barang.id_jenisbarang=hasil.id_jenisbarang JOIN customer ON customer.id_customer=hasil.id_customer WHERE hasil.hasil=(SELECT MAX(hasil) FROM hasil WHERE id_jenisbarang='$this->idCookie')";
    $execute        =   $this->getConnect()->query($queryHasil)->fetch_array(MYSQLI_ASSOC);
    echo "<p>Jadi rekomendasi pemilihan customer <i>$execute[namaBarang]</i> jatuh pada <i>$execute[namacustomer]</i> dengan Nilai <b>".round($execute['hasil'],3)."</b></p>";
    }

}