require 'httparty'

emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/validacao/uniao')

puts emailAPI.body
