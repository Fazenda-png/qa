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
  @form = @Oportunidade.formulario
  @form.cadastraOportunidade
end

Então("deverá aparecer {string}") do |mensagem|
  expect(@home.message_op.text).to eql mensagem
end

Quando('preencher os campos {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |nome, tipo, cpf, cnpj, email, nome_cont, email_cont|
  @form_erro = @Oportunidade.formulario
  @form_erro.cadastro_error(nome, tipo, cpf, cnpj, email, nome_cont, email_cont)
end

Então('deverá aparecer {string} e {string}') do |mensagem, local|
  @form_alert = @Oportunidade.formulario
  expect(@form_alert.error_cad(local)).to eql mensagem
end
