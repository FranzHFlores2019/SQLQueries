

DECLARE @ID UNIQUEIDENTIFIER = NEWID()
PRINT @ID
INSERT PaymentMethodType VALUES(NEWID(),'Electronic Payment')
INSERT PaymentMethodType VALUES(NEWID(),'Gif Card')
INSERT PaymentMethodType VALUES(NEWID(),'Cash')
INSERT PaymentMethodType VALUES(NEWID(),'Crypto Currency')
INSERT PaymentMethodType VALUES(NEWID(),'Check')

SELECT distinct  @@ROWCOUNT pmt_name, pmt_name as name   FROM PaymentMethodType
order by name desc



