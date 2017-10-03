class Position < ApplicationRecord
  ASSET_CLASSES = {
    Equities: {
      US_Equity: ["Equity", "Giant Cap Equity", "Large Cap Equity", "Mid Cap Equity", "Small Cap Equity", "Micro Cap Equity"],
      Foreign_Equity: ["Foreign Equity", "Giant Cap Foreign", "Large Cap Foreign", "Mid Cap Foreign", "Small Cap Foreign", "Micro Cap Foreign"],
      Other: ["ETF", "Other Equity"]
    },
    Alternatives: {
      Hedge_Funds: ["Hedge Funds"],
      Other: ["Closed End Fund"]
    },
    Fixed_Income_and_Cash: {
      Fixed_Income: ["Bond"],
      Cash: ["Money Market", "Cash", "Currency"]
    },
      Other: {
        Funds: ["Index", "Mutual Fund"],
        Other: ["Option", "Other"]
    }
  }

  belongs_to :portfolio
  after_create :set_sac
  monetize :value_cents

  def set_sac
    ASSET_CLASSES.select do |key1, value1|
      value1.each do |key2, value2|
        value2.each do |ac|
          self.update(sac1: key1.to_s.gsub('_', " "), sac2: key2.to_s.gsub('_', " ")) if ac == self.asset_class
          # self.update(asset_class: "Large Cap Equity")if ac == "Equity"
        end
      end
    end
  end

end
