#encoding: utf-8
class MessageController < ApplicationController
  def show
    @unread_messages = current_user.recieved_messages.where :read => false, :recipient_deleted => false
  end

  def recipience
    @messages = Message.where(:recipient_id => current_user.id, :recipient_deleted => false)
  end

  def recipience_read
    @message = Message.find(params[:id])
    if current_user == @message.recipient
      @message.read = true
      @message.save
    else
      flash[:alert] = "Sie haben nicht die benötigte Berechtigung hierfür!"
      redirect_to root_path
    end
  end

  def recipience_delete
    @message = Message.find(params[:id])
    if current_user == @message.recipient
      @message.recipient_deleted = true
      @message.save
    else
      flash[:alert] = "Sie haben nicht die benötigte Berechtigung hierfür!"
    end

    redirect_to user_recipience_message_path
  end

  def sent
    @messages = Message.where(:sender_id => current_user.id, :sender_deleted => false)
  end

  def sent_read
    @message = Message.find(params[:id])
    if current_user == @message.sender
      @message.save
    else
      flash[:alert] = "Sie haben nicht die benötigte Berechtigung hierfür!"
      redirect_to root_path
    end
  end

  def sent_delete
    @message = Message.find(params[:id])
    if current_user == @message.sender
      @message.sender_deleted = true
      @message.save
    else
      flash[:alert] = "Sie haben nicht die benötigte Berechtigung hierfür!"
    end

    redirect_to user_sent_message_path
  end
end
