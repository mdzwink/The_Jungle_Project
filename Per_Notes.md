
feature/sold-out-badge  << return to style

if product.quantity ==0 
sold-out = true
:disabled => sold-out

fix/empty-cart-ui   << return to style

cart still shows empty table and checkout option when cart is empty

approach:
find where table and checkout feature is being rendered () and either 
1. make it conditional on cart quantity () OR  <== FIRST CHOICE
2. intercept render and point elsewhere?
end goal:
show friendly alert () and provide link to home ()


fix/money-formatting

product page
cart
admin >> (All) Products


fix>>

found 'humanized_money_with_symbol' applied in app\views\products\_product.html.erb

added to:
app\views\admin\products\_product.html.erb
app\views\carts\_item.html.erb
app\views\carts\show.html.erb
app\views\products\show.html.erb


---------------


bin/rails routes


console is powerfull with more information in terminal than in/with js

in erb:
<% raise @category.inspect %>

<% debug @category %>
