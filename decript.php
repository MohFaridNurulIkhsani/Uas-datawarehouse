<?php
error_reporting(0);
$password = '12345678';
$crypted = password_hash($password, PASSWORD_DEFAULT);
print $crypted;
# Coded by L0c4lh34rtz - IndoXploit

# \n -> linux
# \r\n -> windows
$list = explode("\n", file_get_contents($argv[1])); # change \n to \r\n if you're using windows
# ------------------- #

$hash = '$2y$10$M80eHFnCpX6RzDiN7LfRNeNMmUZM51y4gT9NqnerVnud9onIWBvyq'; # hash here, NB: use single quote (') , don't use double quote (")

if(isset($argv[1])) {
    foreach($list as $wordlist) {
        print " [+]"; print (password_verify($wordlist, $hash)) ? "$hash -> $wordlist (OK)\n" : "$hash -> $wordlist (SALAH)\n";
    }
} else {
    print "usage: php ".$argv[0]." wordlist.txt\n";
}
if (password_verify('12345678', $crypted)) {
    echo 'Password is valid!';
} else {
    echo 'Invalid password.';
}
?>