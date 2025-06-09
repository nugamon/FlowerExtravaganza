<?php
class User
{
    private $conn;
    private $table_name = "Users";
    public $id;
    public $name;
    public $surname;
    public $lastname;
    public $email;
    public $password;
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function create()
    {
        $query = "INSERT INTO " . $this->table_name . "
        SET
        Name = :name,
        Surname = :surname,
        Lastname = :lastname,
        email = :email,
        password = :password,
        role = 1";
        $stmt = $this->conn->prepare($query);
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->surname = htmlspecialchars(strip_tags($this->surname));
        $this->lastname = htmlspecialchars(strip_tags($this->lastname));
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":lastname", $this->lastname);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":password", $this->password);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    public function check_user_credentials($email, $password)
    {
        $query = "SELECT id FROM " . $this->table_name . " WHERE email = ? AND password = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $email);
        $stmt->bindParam(2, $password);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->id = $row['id'];
            return true;
        }
        return false;
    }
    public function readOne()
    {
        $query = "SELECT name, surname, lastname, email FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $this->name = $row['name'];
        $this->surname = $row['surname'];
        $this->lastname = $row['lastname'];
        $this->email = $row['email'];
    }
    function update()
    {
        $query = "UPDATE " . $this->table_name . "
            SET
                name = :name,
                surname = :surname,
                lastname = :lastname,
                email = :email
            WHERE
                id = :id";
        $stmt = $this->conn->prepare($query);
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->surname = htmlspecialchars(strip_tags($this->surname));
        $this->lastname = htmlspecialchars(strip_tags($this->lastname));
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->id = htmlspecialchars(strip_tags($this->id));
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":lastname", $this->lastname);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":id", $this->id);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    public function get_user_role($email)
    {
        $query = "SELECT role FROM users WHERE email = :email";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':email', $email);
        if ($stmt->execute()) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row['role'];
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
public function hasAdminRole($userId) {
    $query = "SELECT role FROM users WHERE id = :id";
    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(':id', $userId);
    if ($stmt->execute()) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            return $row['role'] == 2;
        } else {
            return false;
        }
    } else {
        return false;
    }
}
}
?>