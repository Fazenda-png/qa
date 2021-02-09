Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
  @oportunidade = $ec_pages.oportunidades
end

Dado("esteja na pagina de oportunidades") do
  @home.abrir_oportunidades.click
  @btnOp = @oportunidade.listagem
  @btnOp.btn_cadastro.gclick
end

Quando("preencher os campos") do
  @form = @oportunidade.formulario
  @oportunidade = @form.cadastraOportunidade
end

Quando('preencher os campos {string}') do |erro|
  @form_erro = @oportunidade.formulario
  @form_erro.cadastro_error(erro)
end

Então("deverá aparecer {string}") do |mensagem|
  expect(@home.message_op.text).to eql mensagem
  @form.postOportunidade(@oportunidade)
end

Então('deverá aparecer {string} e {string}') do |mensagem, local|
  @form_alert = @oportunidade.formulario
  expect(@form_alert.error_cad(local)).to eql mensagem
end
