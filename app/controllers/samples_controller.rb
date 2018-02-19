class SamplesController < ApplicationController
  def index
    @invoice = {'name': 'vamsi', 'instructor': 'balu'}
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/samples.pdf")

    encoded_string = Base64.encode64(File.read(Rails.root.join("tmp", 'invoice.pdf')))
    render json: { message: encoded_string }
  end

  def as_html
    render template: "samples/pdf",
    layout: 'invoice_pdf',
    locals: { invoice: @invoice }
  end
end
