require 'httparty'

emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/cliente')

puts emailAPI.body
