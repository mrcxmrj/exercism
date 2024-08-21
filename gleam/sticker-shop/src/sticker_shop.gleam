import gleam/list

pub type Usd

pub type Eur

pub type Jpy

pub opaque type Money(currency) {
  Money(amount: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount:)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount:)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount:)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  Money(
    list.fold(prices, 0, fn(current_sum, price) { price.amount + current_sum }),
  )
}
