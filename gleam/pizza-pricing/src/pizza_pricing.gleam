import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn pizza_price_loop(pizza: Pizza, current_price: Int) -> Int {
  case pizza {
    Margherita -> current_price + 7
    Caprese -> current_price + 9
    Formaggio -> current_price + 10
    ExtraSauce(pizza) -> pizza_price_loop(pizza, current_price + 1)
    ExtraToppings(pizza) -> pizza_price_loop(pizza, current_price + 2)
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_loop(pizza, 0)
}

fn order_pizza_prices(order: List(Pizza), current_price: Int) {
  case order {
    [] -> current_price
    [pizza, ..rest] ->
      order_pizza_prices(rest, current_price + pizza_price(pizza))
  }
}

fn extra_fee(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  order_pizza_prices(order, 0) + extra_fee(order)
}
