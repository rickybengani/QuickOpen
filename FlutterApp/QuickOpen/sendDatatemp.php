<?php 
    if (isset($_POST['email']) && isset($_POST['url'])) {
        $servername = "localhost";
        $user = "root";
        $pw = "Newtech21!";
        $db = "quickopen";
        #Connect to Server
        $conn = new Mysqli($servername, $user, $pw, $db) or die(Mysqli_errno());

        // $value =htmlspecialchars(stripslashes(trim($_POST["value"])));
        $email = $_POST['email'];
        $url = $_POST['url'];
        
        // Check if email exists
        // If yes
        // Update url
        // else
        // Add email and url in new line

        // $sql = $con->prepare("INSERT INTO tableName (value) VALUES ('$value')");
        // $result = $sql->execute();
        
        $result = $conn->query("SELECT id FROM email_url WHERE email = '{$email}'");
        if ($result->num_rows == 0) {
            $finalUrl = $conn->query("SELECT url FROM email_url WHERE email = '{$email}'");
            $update = $conn->query("UPDATE email_url SET url = '{$url}' WHERE email = '{$email}'");
            echo "URL updated.";
        }
        else {
            $insert = $conn->query("INSERT INTO email_url (email, url) VALUES ('{$email}', '{$url}')");
            echo "Email and URL added.";
        }
        $conn->close();
    } 
    else {
       echo "Not found";
    } 
?>