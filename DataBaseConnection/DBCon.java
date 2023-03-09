package DataBaseConnection;

import javax.sql.rowset.RowSetWarning;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBCon {
    public static void main(String[] args) throws SQLException {
        Properties properties = new Properties();
        try (InputStream input = new FileInputStream("src/main/resources/sql.properties")){
            properties.load(input);
        }catch (FileNotFoundException e){
            throw new RuntimeException(e);
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        Connection connection = DriverManager.getConnection(properties.getProperty("database.url"),
                properties.getProperty("database.login"), properties.getProperty("database.pass"));

        System.out.println("Что вы хотите сделать с таблицей");
        System.out.println("Выберите значение 1 или 2");




        // Получить данные из таблиц
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM human_friends.dog");
//        ResultSet resultSet = statement.executeQuery();

        // Добавление данных в таблицу или создать таблицу.
//        statement.executeUpdate("CREATE TABLE ......");                      // Записать запрос в скобках

        // Вывод в консоль
        while (resultSet.next()){
            System.out.println(resultSet.getString(1) + " "+ resultSet.getString(2)+ " "+
                    resultSet.getString(3) + " " + resultSet.getString(4) + " ");
        }
        connection.close();
    }


}
