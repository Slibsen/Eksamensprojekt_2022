from multiprocessing import connection
import mysql.connector
import json
import datetime

try:
    connection = mysql.connector.connect(
        host='localhost',
        database='Byggemarked',
        user='root',
        password='fffff')

    sql_select_Query = 'select * from Produkt'

    cursor = connection.cursor()
    cursor.execute(sql_select_Query)

    #Get all records

    records = cursor.fetchall()
    print("Total number of rows in table: ", cursor.rowcount)

    print("\nPrinting each row now")
    numberOfProducts = 0

    for row in records:

        graph = {
        'Produkt': [{'ID': row[0], 'Name': row[1], 'Kat_ID': row[2],
        'Eco_ID': row[3], 'Enhedstype': row[4], 'Enhedstype': row[5],
        'Leveringsdato': row[6]}]
        }
        with open('graph.js', 'w') as out_file:
            out_file.write('var graph = %s;' % json.dumps(graph))

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
