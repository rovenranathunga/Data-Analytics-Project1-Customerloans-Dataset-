-- Track loan book performnace - Disbursements, amount paid MOM, returns, debt to income ratio, loss rate


SELECT 
date_format(LoanOriginationDate, '%Y-%m-01 00:00:00') as month,
date_format(LoanOriginationDate, '%Y') as year,
sum(LoanOriginalAmount) as total_dis,
round(sum(LP_CustomerPayments),0) as total_paid,
round(avg(EstimatedReturn),2) as profit,
round(avg(EstimatedLoss),2) as lossrate,
round(avg(DebtToIncomeRatio),2) as debtincome

FROM loan_dataset.prosperloandata
WHERE LoanoriginationDate > '2009-12-31'
Group by 1,2
Order by 1;
