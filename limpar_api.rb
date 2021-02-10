require 'httparty'

emailAPI = HTTParty.get('https://api-desafio.vercel.app/api/limpar')

puts emailAPI.body
