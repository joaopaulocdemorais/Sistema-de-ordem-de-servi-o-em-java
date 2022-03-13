
package br.com.infox.dal;
import java.sql.*;

public class ModuloConexao {
   // o metodo abaixo faz a conexao com o banco de dados
   public static Connection conector(){
       java.sql.Connection conexao = null; 
       // a linha abaixo chama o drive de coneção com o banco de dados
       String driver = "com.mysql.jdbc.Driver";
       //Armazenando informações referentes ao banco de dados
       String url = "//127.0.0.1:3306/dbinfox";
       String user = "root";
       String password = "Jopacamo@1996";
       // fazendo a conexão com o banco de dados
       try {
           Class.forName(driver);
           conexao = DriverManeger.getConnection(url, user, password);
       } catch (Exception e) {
       }
   }  
           
}
