require 'httparty'

emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/validacao/oportunidade')

puts emailAPI.body
