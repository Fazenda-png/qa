Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
  @oportunidade = $ec_pages.oportunidades
end

Dado("esteja na pagina de oportunidades") do
  @home.abrir_oportunidades.click
  @btnOp = @oportunidade.listagem
end

Quando("cadastrar oportunidade") do
  @btnOp.btn_cadastro.gclick
  @form = @oportunidade.formulario
  @oportunidade = @form.cadastraOportunidade
end

Quando('tentar cadastrar oportunidade {string}') do |erro|
  @btnOp.btn_cadastro.gclick
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

Dado('que possua Oportunidade cadastrada') do
  @listagem = @oportunidade.listagem
  pending unless @listagem.has_oportunidades?
end

Quando('deletar Oportunidades') do
  @listagem.checkall.gclick
  @listagem.btn_deletar.gclick
  @oportunidade.btn_confirmar.gclick
end

Então('deverá aparecer a mensagem: {string}') do |mensagem|
  expect(@home.message_op.text).to eql mensagem
end
