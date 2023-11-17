package bd

import (
	"database/sql"
	"fmt"
	"github.com/JrGustavo/petal0/models"
)

func InserCategory(c models.Category) (int64, error) {
	fmt.Println("Comienza registro de InsertCategory")

	err := DbConnect()
	if err != nil {
		return 0, err
	}

	defer Db.Close()

	sentencia := "INSERT INTO category (Categ_Name, Catteg_Path) VALUES ('" + c.CategName + "', '" + c.CategPath + "')"

	var result sql.Result
	result, err = Db.Exec(sentencia)
	if err != nil {
		return 0, err
	}

	LastInsertId, err2 := result.LastInsertId()
	if err2 != nil {
		return 0, err2
	}

	fmt.Println("Insert Category > Ejecución exitosa")
	return LastInsertId, nil
}
