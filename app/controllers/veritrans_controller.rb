class VeritransController < ApplicationController
  protect_from_forgery :except => [:cancel, :notification, :finish, :error]

  # post action after user submit checkout-form 
  # Ex POST:
  # {"gross_amount" => "7000000",
  #  "commodity"=>[
  #    {
  #    "COMMODITY_ID"    => "Espirit", 
  #    "COMMODITY_UNIT"  => "500000",
  #    "COMMODITY_NUM"   => "4",
  #    "COMMODITY_NAME1" => "Espirit"
  #    },
  #    {
  #    "COMMODITY_ID"    => "Tablet", 
  #    "COMMODITY_UNIT"  => "2500000",
  #    "COMMODITY_NUM"   => "2",
  #    "COMMODITY_NAME1" => "Tablet"
  #    }]}
  # Return from get_keys: 
  # TOKEN_MERCHANT = dYWRjRr2ZbJEqMQaqDLIaWeoLl1Tuk3g7g3T1gKGrE5ibYJoZ4
  # TOKEN_BROWSER  = lh4TxpAyB2NhrKTlqGbW1LRPoA6RgyI6roJ2EIII6J29j7gYoP
  def confirm
    puts params.inspect
    client = ::Veritrans::Client.new
    client.order_id     = "dummy#{(0...12).map{65.+(rand(25))}.join}"
    client.session_id   = "session#{(0...12).map{65.+(rand(25))}.join}"
    client.gross_amount = params["gross_amount"]
    client.commodity    = params["commodity"]

    client.customer_specification_flag = "1" #'1':Different Address with shipping
    client.shipping_flag = "0"               #'0':Not required shipping address

    if params["sample_cc_info"]
      client.card_no       = "4111111111111111"
      client.card_exp_date = "11/14"
    end
    #client.email = "sam.anthony@gmail.com" # notification email

    client.get_keys
    @client = client
    # puts params.inspect
    #puts client.inspect
    
    #render :layout => 'layout_auto_post'
  end

  # post-redirection from Veritrans to Merchants Web
  # Ex: {"orderId"  =>"dummy877684698685878869896765",
  #      "sessionId"=>"session837985748788668181718189"}
  def cancel_pay
    # logic after user cancel the transaction
    puts params.inspect

    #render :text => "CANCEL_PAY"
  end

  # Server to Server post-notification(action) from Veritrans to Merchants Server 
  # Ex: {"mErrMsg"=>"",
  #      "orderId"=>"dummy877684698685878869896765",
  #      "mStatus"=>"success",
  #      "vResultCode"=>"C001000000000000",
  #      "TOKEN_MERCHANT"=>"dYWRjRr2ZbJEqMQaqDLIaWeoLl1Tuk3g7g3T1gKGrE5ibYJoZ4"}
  def notification
    # logic to check:
    # 1.validate request
    # 2.update db if valid 

    puts "vvvvvvvvvvvvvv"
    puts params.inspect

    render :text => "OK"  
  end

  # post-redirection from Veritrans to Merchants Web
  # Ex: {"orderId"=>"dummy877684698685878869896765",
  #      "mStatus"=>"success",
  #      "vResultCode"=>"C001000000000000",
  #      "sessionId"=>"session837985748788668181718189"}
  def finish
    # logic after success transaction accured
    puts params.inspect

    #render :text => "FINISH. \n\nSession: #{session.inspect} \n#{session[:myname]}\n..."
  end

  # need scenario that could be try
  # post-redirection from Veritrans to Merchants Web
  # Ex: {"orderId"=>"dummy877684698685878869896765",
  #      "mStatus"=>"failure",
  #      "vResultCode"=>"NH13000000000000",
  #      "sessionId"=>"session837985748788668181718189"}
  def error
    # logic after error transaction accured
    puts params.inspect

    #render :text => "ERROR"
  end

end
