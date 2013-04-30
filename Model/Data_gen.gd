
[General]
Version=1

[Preferences]
Username=
Password=2608
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=POLICY
Count=32

[Record]
Name=POLICY_ID
Type=NUMBER
Size=38
Data=Sequence(1, [1], [100])
Master=

[Record]
Name=DESCRIPTION
Type=CLOB
Size=
Data=Text(100, 10, 3)
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=38
Data=Random(30, 55) + ['.']  + Random(00, 99)
Master=

[Record]
Name=RENEWAL_DURATION
Type=NUMBER
Size=38
Data=Random(1, 30)
Master=


[Table]
Owner=SYSTEM
Name=PROPERTY
Count=18

[Record]
Name=POLICY_ID
Type=NUMBER
Size=38
Data=Sequence(1, [1], [18])
Master=

[Record]
Name=PROPERTY_CODE
Type=NUMBER
Size=1
Data=Random(1, 5)
Master=

[Record]
Name=AGE_OF_PROPERTY
Type=NUMBER
Size=38
Data=Random(1, 30)
Master=

[Record]
Name=PROPERTY_VALUE
Type=NUMBER
Size=38
Data=Random(50000, 1000000)
Master=


[Table]
Owner=SYSTEM
Name=LIFE
Count=14

[Record]
Name=POLICY_ID
Type=NUMBER
Size=38
Data=Sequence(19, [1], [32])
Master=

[Record]
Name=OCCUPATION_CODE
Type=NUMBER
Size=38
Data=Random(1, 50)
Master=

[Record]
Name=DANGER_INDICATOR
Type=FLOAT
Size=22
Data=Random(0, 10) + '.' + Random(0, 99)
Master=


[Table]
Owner=SYSTEM
Name=CUSTOMER
Count=10..20

[Record]
Name=CUSTOMER_ID
Type=NUMBER
Size=38
Data=Random(100000000, 350000000)
Master=

[Record]
Name=FIRST_NAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=LAST_NAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=BIRTH_DATE
Type=DATE
Size=
Data=Random(01/01/1930, 01/01/1990)
Master=

[Record]
Name=GENDER
Type=NUMBER
Size=1
Data=Random(0, 1)
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=100
Data=Address1 + ' ' + ZIP + ' ' + City + ' ' + Country
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=20
Data=['(+'000') '00'-'000'-'0000]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=100
Data=Email
Master=


[Table]
Owner=SYSTEM
Name=CUSTOMERS_POLICY
Count=1000..2000

[Record]
Name=START_DATE
Type=DATE
Size=
Data=Random(01/01/1980, 01/01/2010)
Master=

[Record]
Name=CUSTOMER_ID
Type=NUMBER
Size=38
Data=list(select customer_id from customer)
Master=

[Record]
Name=POLICY_ID
Type=NUMBER
Size=38
Data=list(select policy_id from policy)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(01/01/1980, 01/01/2010)
Master=

[Record]
Name=BONUS
Type=FLOAT
Size=22
Data=Random(0, 10) + '.' + Random(0, 99)
Master=

[Record]
Name=DETAILS
Type=CLOB
Size=
Data=Text(100, 10, 3)
Master=

[Record]
Name=CUSTOMERS_POLICY_ID
Type=NUMBER
Size=38
Data=Sequence(1, [1], 2000)
Master=


[Table]
Owner=SYSTEM
Name=CLAIM
Count=10..20

[Record]
Name=CLAIM_ID
Type=NUMBER
Size=38
Data=Sequence(1, [1], [200])
Master=

[Record]
Name=CUSTOMERS_POLICY_ID
Type=NUMBER
Size=38
Data=list(select customers_policy_id from customers_policy)
Master=

[Record]
Name=CLAIM_DATE
Type=DATE
Size=
Data=Random(01/01/1980, 01/01/2010)
Master=

[Record]
Name=DESCRIPTION
Type=CLOB
Size=
Data=Text(100, 10, 3)
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=38
Data=Random(50, 100000)
Master=

[Record]
Name=STATUS
Type=NUMBER
Size=1
Data=Random(0, 9)
Master=

[Record]
Name=RESULT
Type=CLOB
Size=
Data=Text(100, 10, 3)
Master=

[Record]
Name=SETTLEMENT_DATE
Type=DATE
Size=
Data=Random(01/01/1980, 01/01/2010)
Master=

