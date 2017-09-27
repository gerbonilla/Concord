Client can:

- see CAS of accounts
- see exposure of certain sector
- see position breakdown
- add or remove accounts
- sort by IRA/ non IRA
- see it in $ or %

- see latest transactions
- see expense breakdown by month and year


steps
1 - rechange the models so they match quovo and feed data correctly to concord DB
2 - tabs
3 - build accounts tab
4 - build investments (CAS) tab
6 - build bot function ***************************
5 - build transactions tab

I'm doing this on Wednesday/Thursday/Friday

- remove card - remove transaction - remove account - add position - add portfolio - add account - add transaction

---Equities---
Equity #should be US eq
Giant Cap Equity
Large Cap Equity
Mid Cap Equity
Small Cap Equity
Micro Cap Equity
Foreign Equity
Giant Cap Foreign
Large Cap Foreign
Mid Cap Foreign
Small Cap Foreign
Micro Cap Foreign
Other Equity
ETF

---Alts---
Hedge Fund
Closed-End Fund

---Fixed Income---
Bond

---Cash---
Money Market
Cash
Currency

---Other---
Index
Mutual Fund
Option
Other


***Account
  *"brokerage"
  *"brokerage_name"
  *"id" #quovo_id
  *"is_inactive"
  *"last_good_sync"
  *"nickname"
  *"opened"
  *"user"
  *"username"
  *"value"
  "config_instructions"
  "failures"
  "status"
  "update_count"
  "updated"

***Portfolio
  *account_id
  *"brokerage_name"
  *"description"
  *"id" #quovo_id
  *"is_inactive"
  *"is_taxable"
  *"last_change"
  *"nickname"
  *"owner_type"
  *"portfolio_category"
  *"portfolio_name"
  *"portfolio_type"
  *"portfolio_type_confidence"
  *"user"
  *"username"
  *"value"
  "update_count"
  "brokerage"

***Position
  *portfolio_id
  *"asset_class"
  *"cost_basis"
  *"cost_basis_type"
  *"currency"
  *"cusip"
  *"fxrate"
  *"id" #quovo_id
  *"last_purchase_date"
  *"portfolio" #quovo_portfolio_id
  *"price"
  *"quantity"
  *"sector"
  *"security_type"
  *"security_type_confidence"
  *"ticker"
  *"ticker_name"
  *"value"
  "market_code"
  "portfolio_name"
  "user"
  "username"

***Transaction
  *portfolio_id
  *"currency"
  *"cusip"
  *"date"
  *"expense_category"
  *"fees"
  *"fxrate"
  *"id" # quovo id
  *"is_cancel"
  *"is_pending"
  *"memo"
  *"portfolio"
  *"price"
  *"quantity"
  *"ticker"
  *"ticker_name"
  *"tran_category"
  *"tran_type"
  *"user"
  *"value"



