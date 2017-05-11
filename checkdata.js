/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servet.*;
import javax.servet.http.*;

var host = 'jdbc:mysql://localhost:3306';
var user = 'root';
var pass = 'utkarsh123';

mysql_connect(host, user, pass);

mysql_select_db('logintest');
var email=request.getParamter('Email');
out.println(email);
if(isset(email))
{
 var emailId=email;

 var checkdata="SELECT Email FROM data WHERE Email='emailId'";

 var query=mysql_query(checkdata);

 if(mysql_num_rows(query)>0)
 {
  out.println("Email Already Exists");
 }
 else
 {
  out.println("OK");
 }
 exit();
}
