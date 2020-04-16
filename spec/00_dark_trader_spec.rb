require_relative '../lib/00_dark_trader'

describe "the dark_trader function" do

  it "should return final_crypto, and final_crypto is not nil" do
    expect(final_crypto).not_to be_nil
    expect(final_crypto).not_to be_eq(" ")
  end

  it "should return final_crypto" do
    expect(final_crypto).to eq(final_crypto.length > 10)
    expect(final_crypto[0]).to eq("BTC=>'$7,037.51")
  end

end


#1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide) et 
#2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).