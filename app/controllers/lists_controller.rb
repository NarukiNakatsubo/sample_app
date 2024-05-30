class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end
  
  # newアクションのfram_withにより,自動的にここに遷移する
  def create
    # ビューファイルへの受け渡しが必要でないためローカル変数を利用
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 詳細画面へのリダイレクト
    redirect_to list_path(list.id)
  end
  
  def index
    # Listモデルがやり取りしているデータベースのテーブルに保存されている
    # 全てのレコードをまとめて取得する
    @lists = List.all
  end

  def show
    # idカラムを引数と比べてレコードを取得する
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
