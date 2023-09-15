class TrancePhotoToPath
    #トランプ:数値 > 画像データパス
    def initialize(num)
        trp_path=".png"         #初期値定義（共通）
        trp_category=(num-1)/13
        =begin
            #凡例
                0：♠
                1：♥
                2：♦
                3：☘
        =end

        trp_num=num%13

        if trp_num=1 then
            trp_path="A"+trp_path
        elsif trp_num=11 then
            trp_path="J"+trp_path
        elsif trp_num=12 then
            trp_path="Q"+trp_path
        elsif trp_num=13 then
            trp_path="K"+trp_path
        else
            trp_path=(trp_num).to_s+trp_path

        if trp_category==0 then
            trp_path=".\cardimages\♠"+trp_path
        elsif trp_category==1 then
            trp_path=".\cardimages\♥"+trp_path
        elsif trp_category==2 then
            trp_path=".\cardimages\♦"+trp_path
        elsif trp_category==3 then
            trp_path=".\cardimages\☘"+trp_path
        end
        
        return(trp_path)
    end
end