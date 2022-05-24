
package br.com.infox.dal;
import java.sql.*;

public class ModuloConexao {
   // o metodo abaixo faz a conexao com o banco de dados
   public static Connection conector(){
       Connection conexao = null; 
       // a linha abaixo chama o drive de coneção com o banco de dados
       String driver = "com.mysql.cj.jdbc.Driver";
       //Armazenando informações referentes ao banco de dados
       String url = "jdbc:mysql://127.0.0.1:3306/dbinfox?characterEncoding=utf-8";
       String user = "dba";
       String password = "Jopacamo@1996";
       // fazendo a conexão com o banco de dados
        try {
           Class.forName(driver);
           conexao = DriverManager.getConnection(url, user, password);
           return conexao;
       } catch (Exception e) {
           //a linha baixo serve de apoio para saber qual e o erro
           
           //System.out.println(e);
           return null;
       }   
   
   }  
           
}
