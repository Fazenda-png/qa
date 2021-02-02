require 'faker'
require 'cpf_faker'

class Factory
  def self.user
    {
      cpf: Faker::CPF.pretty,
      cnpj: Faker::CNPJ.pretty,
      apelido: Faker::Space.planet,
      nome: "Test Automation #{Faker::Name.first_name}",
      sobrenome: Faker::Name.last_name,
      senha: "SENHA" + "123456",

      email: "teste.#{Faker::Name.first_name}.#{rand(99)}@mailsac.com",
      celular: "5499999#{rand(9999)}",
      telefone: "543380#{rand(9999)}",
      nascimento: Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%d/%m/%Y')
    }
  end

  def self.address
    {
      cidade: Faker::Address.city,
      cep: '99010051',
      logradouro: 'Rua Coronel Chicuta',
      numero: '575',
      bairro: 'Centro'
    }
  end

  def self.card
    {
      numero: '5155901222280001',
      titular: "Test Automation #{Faker::Name.first_name}",
      validade: '1228',
      cvv: '258'
    }
  end
end
