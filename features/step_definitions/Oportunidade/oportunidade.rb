Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'realizar login com usuário válido'
  step 'realizar login com automationdesafio@mailsac.com e automation123'
  @Oportunidade = $ec_pages.oportunidades
end

Dado("esteja na pagina de oportunidades") do
  @btnOp = @Oportunidade.listagem
  @btnOp.btn_cadastro.click
end
  
Quando("preencher os campos") do

end

Quando("preencher os campos de contato") do

end
  
Então("deverá aparecer {string}") do |string|

end