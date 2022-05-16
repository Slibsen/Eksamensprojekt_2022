from multiprocessing import connection
import mysql.connector

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='Byggemarked',
        user='root',
        password='Hmn53rfj')

    sql_select_Query = 'select * from Produkt'

    cursor = connection.cursor()
    cursor.execute(sql_select_Query)

    #Get all records

    records = cursor.fetchall()
    print("Total number of rows in table: ", cursor.rowcount)

    print("\nPrinting each row now")
    numberOfProducts = 0
    for row in records:
        print("Id = ", row[0], "\n")
        print("Name = ", row[1], "\n")
        print("Kategori_ID  = ", row[2], "\n")
        print("Eco_ID  = ", row[3], "\n")
        print("Enhedstype  = ", row[4], "\n")
        print("Enhedspris  = ", row[5], "\n")
        print("Leveringsdato  = ", row[6], "\n")
        numberOfProducts +=1

    print("Number of products: ", numberOfProducts)

except mysql.connector.Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if connection.is_connected():
        connection.close()
        cursor.close()
        print("MySQL connection is closed")

def update():
    print("BLA BLA UPDATE THIS DB")