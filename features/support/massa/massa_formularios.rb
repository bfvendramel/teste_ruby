require "ffaker"

FORMULARIO_PAYMENTS = {
  info_billing: {
    billing_company_name: FFaker::CompanyIT.name,
    billing_address: FFaker::AddressBR.street,
    billing_city: FFaker::AddressBR.city,
    billing_state: FFaker::AddressBR.state_abbr,
    billing_postal_code: FFaker::AddressBR.zip_code,
    billing_country: "BR",
    billing_phone: FFaker::PhoneNumberBR.mobile_phone_number,
    billing_email: FFaker::Internet.disposable_email,
  },
}.freeze

FORMULARIO_PAYMENTS_FRAUDE = {
  info_billing_fraude: {
    billing_full_name: "Teste Fraude",
    billing_address: FFaker::AddressBR.street,
    billing_city: FFaker::AddressBR.city,
    billing_state: FFaker::AddressBR.state_abbr,
    billing_postal_code: "02017001",
    billing_country: "BR",
    billing_phone: FFaker::PhoneNumberBR.mobile_phone_number,
    billing_email: "teste@fraude.com.br",
  },
}.freeze

MAXIPAY = {
  info_maxipay: {
    first_name: FFaker::NameBR.first_name,
    last_name: FFaker::NameBR.last_name,
    phone: "11987456321", #FFaker::PhoneNumberBR.mobile_phone_number,
    address: FFaker::AddressBR.street, #"Rua Alfredo Pujol, 534",
    city: FFaker::AddressBR.city, #"São Paulo",
    state: "SP",
    country: "BR",
    zip_code: "02017002",
  },
}.freeze

MAXIPAY_BILLING = {
  info_maxipay: {
    billing_cnp_cnpj: FFaker::IdentificationBR.cpf,
    billing_rg: FFaker::IdentificationBR.rg,
    billing_full_name: FFaker::NameBR.name,
    billing_address: FFaker::AddressBR.street,
    billing_city: FFaker::AddressBR.city,
    billing_bairro: FFaker::Address.neighborhood,
    billing_state: FFaker::AddressBR.state_abbr,
    billing_country: "BR",
    billing_zip_code: FFaker::AddressBR.zip_code,
    billing_phone: "11987456321", #FFaker::PhoneNumberBR.mobile_phone_number,
  },
}.freeze

MAXIPAY_SHIPPING = {
  info_maxipay: {
    shipping_cnp_cnpj: FFaker::IdentificationBR.cpf,
    shipping_rg: FFaker::IdentificationBR.rg,
    shipping_full_name: FFaker::NameBR.name,
    shipping_address: FFaker::AddressBR.street,
    shipping_city: FFaker::AddressBR.city,
    shipping_bairro: FFaker::Address.neighborhood,
    shipping_state: FFaker::AddressBR.state_abbr,
    shipping_country: "BR",
    shipping_zip_code: FFaker::AddressBR.zip_code,
    shipping_phone: "11987456321", #FFaker::PhoneNumberBR.mobile_phone_number,
    shipping_email: FFaker::Internet.disposable_email,
  },
}.freeze

ADDING_CUSTOMER = {
  info_customer: {
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    consumer_id: rand(10000000000..99999999999),
    address: FFaker::AddressBR.street,
    city: FFaker::AddressBR.city,
    state: FFaker::AddressBR.state_abbr,
    zip_code: FFaker::AddressBR.zip_code,
    country: "BR",
    phone: "11987456321", #FFaker::PhoneNumberBR.mobile_phone_number,
    alternate_phone: "11987456322", #FFaker::PhoneNumberBR.mobile_phone_number,
    email: FFaker::Internet.disposable_email,
  },
}.freeze

LINK_TRES_ZERO = {
  info_link_zero: {
    full_name: FFaker::Name.name,
    email: FFaker::Internet.disposable_email,
  },
}.freeze

#FFaker::Address.country_code,