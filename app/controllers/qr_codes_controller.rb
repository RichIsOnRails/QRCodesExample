class QrCodesController < ApplicationController
  def new
  end

  def create
    @qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
  end

private 
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end

# string - the string you wish to encode 
# size   - the size of the qrcode (default 4)
# level  - the error correction level, can be:
#   * Level :l 7%  of code can be restored
#   * Level :m 15% of code can be restored
#   * Level :q 25% of code can be restored
#   * Level :h 30% of code can be restored (default :h) 
