<div class="panel"style="background-color:#92B8CA">
    <div class="panel-middle" id="judul">
        <img src="asset/image/customer.png" style="weight: 30px;height:30px;">
        <div id="judul-text">
            <h2 style="color:#000000">Customer</h2>
            Halamanan Administrator customer
        </div>
    </div>
</div>
<!-- judul -->
<div class="row">
    <div class="col-4">
        <div class="panel">
            <?php
            if (@htmlspecialchars($_GET['aksi'])=='ubah'){
                include 'ubahcustomer.php';
            }else{
                include 'tambahcustomer.php';
            }
            ?>
        </div>
    </div>
    <div class="col-8">
        <div class="panel">
            <div class="panel-top">
                <b class="text-green">Daftar customer</b>
            </div>
            <div class="panel-middle">
                <div class="table-responsive">
                    <table>
                        <thead><tr><th>No</th><th>Nama</th><th>Aksi</th></tr></thead>
                        <tbody>
                        <?php
                        $query="SELECT * FROM customer";
                        $execute=$konek->query($query);
                        if ($execute->num_rows > 0){
                            $no=1;
                            while($data=$execute->fetch_array(MYSQLI_ASSOC)){
                                echo"
                                <tr id='data'>
                                    <td>$no</td>
                                    <td>$data[namacustomer]</td>
                                    <td>
                                    <div class='norebuttom'>
                                    <a class=\"btn btn-light-green\" href='./?page=customer&aksi=ubah&id=".$data['id_customer']."'><i class='fa fa-pencil-alt'></i></a>
                                    <a class=\"btn btn-yellow\" data-a=".$data['namacustomer']." id='hapus' href='./proses/proseshapus.php/?op=customer&id=".$data['id_customer']."'><i class='fa fa-trash-alt'></i></a>
                                    </div></td>
                                </tr>";
                                $no++;
                            }
                        }else{
                            echo "<tr><td  class='text-center text-green' colspan='3'>Kosong</td></tr>";
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel-bottom"></div>
        </div>
    </div>
</div>