require 'httparty'

emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/validacao/cliente')

puts emailAPI.body


