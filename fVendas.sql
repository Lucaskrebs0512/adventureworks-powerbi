select 
	to_char( data_venda, 'YYYYMM') as ref_venda, * from (
		select *, 
		CASE
        WHEN date_part('hour'::text, t.data_venda_timestamp ) >= 0::double precision AND date_part('hour'::text, t.data_venda_timestamp) <= 6::double precision THEN 1
        WHEN date_part('hour'::text, t.data_venda_timestamp ) >= 7::double precision AND date_part('hour'::text, t.data_venda_timestamp) <= 12::double precision THEN 2
        WHEN date_part('hour'::text, t.data_venda_timestamp) >= 13::double precision AND date_part('hour'::text, t.data_venda_timestamp) <= 18::double precision THEN 3
        WHEN date_part('hour'::text, t.data_venda_timestamp) >= 19::double precision AND date_part('hour'::text, t.data_venda_timestamp) <= 23::double precision THEN 4
        ELSE NULL::integer
    END AS turno_venda,
	case
	    when status_pedido = 5 then 1
	    else 0
	end venda,
	t.data_venda_timestamp::date data_venda
	  from (
		select
		    be.businessentityid id_entidade,
			case
			    when c.customerid is not null then 'cliente'
			    when v.businessentityid is not null then 'fornecedor'
			    when s.businessentityid is not null then 'loja'
			    when p.businessentityid is not null then 'pessoa'
			    else 'outra entidade'
			end tipo_entidade,
		    p.businessentityid id_pessoa,
		    concat_ws(' ',p.firstname, p.lastname) nome_pessoa,
		    s.businessentityid id_loja,
		    s.name nome_loja,
		    v.businessentityid id_fornecedor,
		    v.name nome_fornecedor,
		    v.accountnumber numero_conta_fornecedor,
		    c.customerid id_cliente,
		    soh.salesorderid id_pedido,
		    soh.orderdate data_venda_timestamp,
		    soh.status status_pedido,
		    case
			    when soh.status = 1 then 'em processamento'
			    when soh.status = 2 then 'aprovado'
			    when soh.status = 3 then 'pendente por falta de estoque'
			    when soh.status = 4 then 'rejeitado'
			    when soh.status = 5 then 'enviado'
			    when soh.status = 6 then 'cancelado'
			    when soh.salesorderid is null then 'sem pedido'
			    else null
			end descricao_status,
			soh.subtotal valor_produtos_pedido,
		    soh.taxamt valor_impostos,
		    soh.freight valor_frete,
		    soh.totaldue valor_total_pedido,
		    sod.salesorderdetailid id_item_pedido,
		    sod.productid id_produto,
		    produto.name nome_produto,
		    sod.orderqty quantidade,
		    sod.unitprice preco_unitario,
		    sod.unitpricediscount percentual_desconto,
		    sod.orderqty * sod.unitprice * (1 - sod.unitpricediscount) valor_item,
		    bec.personid id_pessoa_contato,
		    concat_ws(' ', contato.firstname, contato.lastname) nome_contato,
		    ct.name tipo_contato,
		    a.addressid id_endereco,
		    at.name tipo_endereco,
		    a.addressline1 endereco,
		    case
			    when soh.salesorderid is null then 'sem pedido'
			    when soh.onlineorderflag = true then 'online'
			    when soh.onlineorderflag = false then 'por vendedor'
			    else 'nao informado'
			end canal_venda,
		    a.city cidade,
		    sp.name estado_provincia,
		    cr.name pais_regiao,
		    crc.currencycode codigo_moeda,
		    be.modifieddate::date data_atualizacao_entidade,
		    cambio.fromcurrencycode moeda_origem,
			cambio.tocurrencycode moeda_destino,
			cambio.averagerate taxa_cambio,
			case
			    when cambio.tocurrencycode = 'USD' then soh.totaldue
			    when cambio.fromcurrencycode = 'USD' then soh.totaldue / nullif(cambio.averagerate, 0)
			    else null
			end valor_total_dolar
		from person.businessentity be
		left join person.person p on p.businessentityid = be.businessentityid
		left join sales.store s on s.businessentityid = be.businessentityid
		left join purchasing.vendor v on v.businessentityid = be.businessentityid
		left join sales.customer c on c.personid = p.businessentityid or c.storeid = s.businessentityid
		left join sales.salesorderheader soh on soh.customerid = c.customerid
		left join sales.salesorderdetail sod on sod.salesorderid = soh.salesorderid
		left join production.product produto on produto.productid = sod.productid
		left join person.businessentitycontact bec on bec.businessentityid = be.businessentityid
		left join person.person contato on contato.businessentityid = bec.personid
		left join person.contacttype ct on ct.contacttypeid = bec.contacttypeid
		left join person.businessentityaddress bea on bea.businessentityid = be.businessentityid
		left join person.addresstype at on at.addresstypeid = bea.addresstypeid
		left join person.address a on a.addressid = bea.addressid
		left join person.stateprovince sp on sp.stateprovinceid = a.stateprovinceid
		left join person.countryregion cr on cr.countryregioncode = sp.countryregioncode
		left join sales.countryregioncurrency crc on crc.countryregioncode = cr.countryregioncode
		left join sales.currencyrate cambio on cambio.currencyrateid = soh.currencyrateid
	)t 
  )t where data_venda is not null