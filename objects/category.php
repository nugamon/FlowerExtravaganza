<?php

class Category
{
    private $conn;
    private $table_name = "Categories";

    // свойства объекта
    public $id;
    public $name;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    function read()
    {
        $query = "SELECT
                    id, name
                FROM
                    " . $this->table_name . "
                ORDER BY
                    name";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }
function readName()
{
    $query = "SELECT name FROM " . $this->table_name . " WHERE id = ? limit 0,1";

    $stmt = $this->conn->prepare($query);
    $stmt->bindParam(1, $this->id);
    $stmt->execute();

    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    $this->name = $row["name"];
}
}