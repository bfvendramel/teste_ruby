Dado('que esteja no {string}') do |string|
  visit("https://uol.com.br")
end

Quando('vejo as info do site') do
  binding.pry
end

Entao('o site foi visto') do
  pending # Write code here that turns the phrase above into concrete actions
end