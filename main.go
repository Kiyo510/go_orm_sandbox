package main

import (
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Product struct {
	gorm.Model
	Code  string
	Price uint
}

func main() {
	dsn := "root:@tcp(127.0.0.1:3306)/orm_test?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed connect db")
	}

	//Migration
	//err = db.AutoMigrate(&Product{})
	//if err != nil {
	//	panic("failed migration")
	//}
	//
	////Create
	//db.Create(&Product{
	//	Code:  "D4444",
	//	Price: 1000,
	//})
	//
	////Read
	//var product Product
	//db.First(&product, 1)
	//db.First(&product, "code = ?", "D4444")
	//
	////Update - update product's price to 200
	//db.Model(&product).Update("Price", 200)
	//
	////Update - update Multiple fields
	//db.Model(&product).Updates(Product{Code: "C4444", Price: 2500})
	//db.Model(&product).Updates(map[string]interface{}{"Price": 2501, "Code": "D4444"})
	//
	////Delete
	//db.Delete(&product, 1)
}
