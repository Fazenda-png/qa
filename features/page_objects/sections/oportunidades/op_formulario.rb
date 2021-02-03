require 'httparty'

module Sections
  module Oportunidades
    class Formulario < SitePrism::Section
      element :edt_nome, '#razao_cliente'
      element :cbx_tp_pessoa, '#tipo_pessoa'
      elements :opt_tp_pessoa, '#tipo_pessoa > option'
      element :edt_cpf, '#cpf'
      element :edt_cnpj, '#cnpj'
      element :edt_celular, '#celular_cliente'
      element :edt_email, '#email_cliente'
      element :edt_telefone, '#fone_cliente'
      element :cbx_area_atu, '#id_atuacao'
      elements :opt_area_atu, '#id_atuacao > option'
      element :cbx_origem, '#id_origem'
      elements :opt_origem, '#id_origem > option'
      element :edt_cidade, '#cidade'
      element :cbx_uf, '#uf'
      elements :opt_uf, '#uf > option'
      element :cbx_status, '#id_status_cad'
      element :cbx_responsavel, '#id_usuario'
      element :cbx_equipe, '#id_equipe'
      element :edt_valor, '#valor'
      element :edt_descricao, '#descricao'
      element :cbx_etapa, '#id_etapa'
      elements :opt_etapa, '#id_etapa > option'

      element :edt_contato_nome, '#nome_contato'
      element :edt_contato_cargo, '#cargo_contato'
      element :edt_contato_email, '#email_contato'
      element :edt_contato_fone, '#fone_contato'
      element :edt_contato_cel, '#celular_contato'
      element :btn_novo_contato, '#btn-inserir-novo-contato'
      elements :rd_contato_principal, '#rd_contato_principal_'

      element :lista_contatos, '#lista_contatos_oportunidade'
      element :btn_salvar, '#btn_salvar_oportunidade'

      def geraOportunidade
        user = Factory.user
        endereco = Factory.address

        tp_pessoa = opt_tp_pessoa[rand(opt_tp_pessoa.size-1)].text
        if tp_pessoa == 'Pessoa Física'
          documento = user[:cpf]
        else
          documento = Factory.CNPJ[rand(Factory.CNPJ.size-1)]
        end

        area_atu = opt_area_atu[rand(opt_area_atu.size-1)].text
        origem = opt_origem[rand(opt_origem.size-1)].text
        uf = opt_uf[rand(opt_uf.size-1)].text
        etapa = opt_etapa[rand(opt_etapa.size-1)].text
        {
          nome: user[:nome],
          tipo_pessoa: tp_pessoa,
          cpf_cnpj: documento,
          celular: user[:celular],
          email: user[:email],
          telefone: user[:telefone],
          area: area_atu,
          origem: origem,
          cidade: endereco[:cidade],
          uf: uf,
          status: 'ATIVO',
          responsavel: cbx_responsavel.text,
          equipe: cbx_equipe.text,
          valor: rand(1..100),
          descricao: user[:nascimento],
          etapa: etapa,

          contato_nome: user[:nome] + ' contato',
          contato_cargo: user[:apelido],
          contato_email: user[:email],
          contato_telefone: user[:telefone],
          contato_celular: user[:celular]
        }
      end

      def cadastraOportunidade
        oportunidade = geraOportunidade

        edt_nome.gset oportunidade[:nome]
        cbx_tp_pessoa.select(oportunidade[:tipo_pessoa])

        if oportunidade[:tipo_pessoa] == 'Pessoa Física'
          edt_cpf.gset oportunidade[:cpf_cnpj]
        else
          edt_cnpj.gset oportunidade[:cpf_cnpj]
        end

        edt_celular.gset oportunidade[:celular]
        edt_email.gset oportunidade[:email]
        edt_telefone.gset oportunidade[:telefone]
        cbx_area_atu.select(oportunidade[:area])
        cbx_origem.select(oportunidade[:origem])
        edt_cidade.gset oportunidade[:cidade]
        cbx_uf.select(oportunidade[:uf])
        # cbx_status.select(oportunidade[:status])
        # cbx_responsavel.select(oportunidade[:responsavel])
        # cbx_equipe.select(oportunidade[:equipe])
        edt_valor.gset oportunidade[:valor]
        edt_descricao.gset oportunidade[:descricao]
        # cbx_etapa.select(oportunidade[:etapa])


        edt_contato_nome.gset oportunidade[:contato_nome]
        edt_contato_email.gset oportunidade[:contato_cargo]
        edt_contato_fone.gset oportunidade[:contato_email]
        edt_contato_cel.gset oportunidade[:contato_telefone]

        btn_novo_contato.gclick
        rd_contato_principal[0].click
        btn_salvar.gclick

        element :error_name, "#razao_cliente_error"
        element :error_email, "#email_cliente_error"
        element :error_cpf, "#cpf-error"
        element :error_cnpj, "#cnpj-error"
        element :error_name_con, ".toast-message"

        time = Time.new
        file = File.open('reports/oportunidades/'+ time.strftime("%m-%d-%Y.%H.%M.%S") + ".txt", 'w') do |fline|
          fline.puts (oportunidade.to_json)
        end

        post = HTTParty.post('https://api-desafio.vercel.app/api/validacao/oportunidade',:headers => {'cache-control': 'public, max-age=0, must-revalidate','content-type': 'application/json'}, :body => oportunidade.to_json)
      end

      def error_cad(local)
        case local
        when input_name_op
          error_name.text
        when input_email_op
          error_email.text
        when input_email_con
          error_email.text
        when input_cpF
          error_cpf.text
        when input_cnpj
          error_cnpj.text
        when input_name_con
          error_name_con.text
        end
      end

      def cadastro_error(nome, tipo, cpf, cnpj, email, nome_cont, email_cont)
        edt_nome.set nome
        cbx_tp_pessoa.select(tipo)
        if cbx_tp_pessoa == 'Pessoa Física'
          edt_cpf.set cpf
        else 
          edt_cnpj.set cnpj
        end
        edt_email.set email
        edt_contato_nome.set nome_cont
        edt_contato_email.set email_cont
      end
    end
  end
end
