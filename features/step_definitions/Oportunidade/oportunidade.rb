Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
  @Oportunidade = $ec_pages.oportunidades
end

Dado("esteja na pagina de oportunidades") do
  @home.abrir_oportunidades.click
  @btnOp = @Oportunidade.listagem
  @btnOp.btn_cadastro.gclick
end

Quando("preencher os campos") do

end

Quando("preencher os campos de contato") do

end

Então("deverá aparecer {string}") do |string|

end
