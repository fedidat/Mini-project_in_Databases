Mini-project in Databases @ JCT 2013
====================================

This course follows its prerequisite, "Databases", which taught theoretical and practical concepts and commands in databases and SQL RDBMS. The objective of this mini-project is to teach the steps and requirements in programming programs surrounding databases. The tools used are DDS Lite 2.21.3 (Database Design Studio) for the table designing, Oracle XE 11.2 (eXpress Edition) for the database itself, PL SQL developer 9.06 for programming methods and Microsoft Visual Studio 2010 for the web client development.

The subject we chose is an insurance model, which allows the user to manage insurance records, among other things.

Stage 1
-------
First, we determined whcih tables we would use (customers, policies, subscribed policies and complaints) and filled them with columns in DDS-Lite. We generated the ERD, DSD and then the SQL script for creating and deleting the tables. Finally, we deployed the script in the database and generated dummy records for testing purposes.

Stage 2
-------
We then created insert/update/delete SQL queries with various elements (join, aggregate, group by, etc), created indexes to improve speed, using commit/rollback in the process and created constraints and views.

Stage 3
-------
We then got to the programming stage. We created PL/SQL procedures and functions, programs to test them, trigger programs and reports using substitution variables.

Stage 4
-------
In the last stage, we left the database world and implemented a web interface that used the previous stages. The GUI was coded in ASP.NET with C#.NET backend, default CSS layout and a custom logo. Disclaimer: the name of the company is fictitious. We used many elements of ASP programming, connected the client to the database (you may find our login in the project code) and used the PL/SQL methods and queries.

Running
-------
In PL/SQL, run Model/Oralce/schmInsurance.sql to generate the tables, optionally use Model/Data_gen.gd to generate dummy records, use the files in Programs to create the methods ans so on. In Visual Studio, open the solution file in ASP.NET_GUI/InsuranceSite, edit the login properties to connect the client to the database. Finally, deploy and you're done.
Warning: This code is unsafe and not ready for real-world deployment. Basic XSS attacks are possible, as I did not take the time or care to make a safe client.

You may find the full doucmentation (in .doc, .docx and .pdf) in the Documentation folder.