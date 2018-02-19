class InvoicesController < ApplicationController
  def index
    kit = PDFKit.new(html: '<h1>vamsi</h1>')
    kit.to_file("tmp/invoice.pdf")
    # file = Rails.root.join("tmp", "invoice.pdf")
    # send_file file, :filename => filename, :type => "application/pdf", :disposition => "attachment"

    respond_to do |format|
      format.json do
        render json: { message: "created" }
      end
    end
  end
end
