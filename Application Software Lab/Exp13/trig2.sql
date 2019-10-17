create trigger trig2
after insert on saleItem
for each row
update product 
set quantityInStock=quantityInStock-new.quantity
where new.barcode=barcode;
