/// id : 1
/// nse_symbol : "HINDCOMPOS"
/// bse_symbol : "509635"
/// company_name : "Hindustan Composites"
/// isin : "INE310C01029"
/// price : 418.45
/// day_range_low : 414
/// day_range_high : 426
/// updated_at : "2024-06-11T11:30:59.958Z"

class Stocks {
  Stocks({
      this.id, 
      this.nseSymbol, 
      this.bseSymbol, 
      this.companyName, 
      this.isin, 
      this.price, 
      this.dayRangeLow, 
      this.dayRangeHigh, 
      this.updatedAt,});

  Stocks.fromJson(dynamic json) {
    id = json['id'];
    nseSymbol = json['nse_symbol'];
    bseSymbol = json['bse_symbol'];
    companyName = json['company_name'];
    isin = json['isin'];
    price = json['price'];
    dayRangeLow = json['day_range_low'];
    dayRangeHigh = json['day_range_high'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? nseSymbol;
  String? bseSymbol;
  String? companyName;
  String? isin;
  num? price;
  num? dayRangeLow;
  num? dayRangeHigh;
  String? updatedAt;
Stocks copyWith({  num? id,
  String? nseSymbol,
  String? bseSymbol,
  String? companyName,
  String? isin,
  num? price,
  num? dayRangeLow,
  num? dayRangeHigh,
  String? updatedAt,
}) => Stocks(  id: id ?? this.id,
  nseSymbol: nseSymbol ?? this.nseSymbol,
  bseSymbol: bseSymbol ?? this.bseSymbol,
  companyName: companyName ?? this.companyName,
  isin: isin ?? this.isin,
  price: price ?? this.price,
  dayRangeLow: dayRangeLow ?? this.dayRangeLow,
  dayRangeHigh: dayRangeHigh ?? this.dayRangeHigh,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nse_symbol'] = nseSymbol;
    map['bse_symbol'] = bseSymbol;
    map['company_name'] = companyName;
    map['isin'] = isin;
    map['price'] = price;
    map['day_range_low'] = dayRangeLow;
    map['day_range_high'] = dayRangeHigh;
    map['updated_at'] = updatedAt;
    return map;
  }

}