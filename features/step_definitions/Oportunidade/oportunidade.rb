Dado("que esteja logado") do
  step 'que esteja na Home'
  step 'acessar Login'
  step 'realizar login com usuário válido'
end

Dado("esteja na pagina de oportunidades") do
  @home.abrir_oportunidades.click
  @oportunidade = $ec_pages.oportunidades
  @btnOp = @oportunidade.listagem
end

Quando("preencher os campos") do
  @btnOp.btn_cadastro.gclick
  @form = @oportunidade.formulario
  @oportunidade = @form.cadastraOportunidade
end

Quando('preencher os campos {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |nome, tipo, cpf, cnpj, email, nome_cont, email_cont|
  @form_erro = @oportunidade.formulario
  @form_erro.cadastro_error(nome, tipo, cpf, cnpj, email, nome_cont, email_cont)
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

