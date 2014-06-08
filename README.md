
# 説明

 操作欄の操作をすると、centos 6.5 が Virtuaxbox で動作するようになります。 
 ViatrulBox, vagrant, paker を事前に install しておく必要があります。  

  [VirtualBox](https://www.virtualbox.org/)  
  [vagrant](http://www.vagrantup.com/)  
  [packer](http://www.packer.io/)  

## 環境

  Oracle VM VirtualBox Manager 4.3.12  
  Vagrant 1.6.3  
  Packer v0.6.0  

# 操作

    $ cd centos
    $ packer validate centos-6.5.json                    # json の内容をチェックします。
    $ packer build -only=virtualbox-iso centos-6.5.json  # centos6.5 の iso を download し, Virtualbox 上で install します。
	                                                     # その結果を vagrant 用の box にします。
      
    $ cd ../vagrant                                      # vagrant  で 作成した box を利用できるようにします。
	$ vagrant box add CentOS-65 box/virtualbox/CentOS-6.5-x86_64-VirtualBox.box
 	$ vagrant init CentOS-65
	$ vagrant up
	$ vagrant ssh
	  exit
	$ vagrant status
	$ vagrant halt

vagrant/Vagrantfile-001 を使って provison すろと、 httpd, php, postgres が稼働する環境になります。  
プラウザで  http://192.168.33.10/ や http://192.168.33.10/info.php にアクセスしてください。  

# 参考
- http://jitsu102.hatenablog.com/entry/2014/03/16/234808  
  Packer で Vagrant 用仮想マシン (base box) を作成する (2014-03-16)  

- https://access.redhat.com/site/documentation/ja-JP/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/ch-kickstart2.html  
  > 第32章 キックスタートインストール  

- http://qiita.com/shin1x1/items/3288d9de7f04192b6ad8  
  > Vagrant体験入門ハンズオン手順 - 2014/04/24 DevLove関西  

- http://www.1x1.jp/blog/2014/04/vagrant-handson-in-devlove-kansai.html  
  > Vagrant体験入門ハンズオンの資料を公開します  
  >>   http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box  

- http://qiita.com/hmukaida/items/23bf728ac08c8fa31f5c  
  > Vagrant+CentOS6.5+Apache2+PHP5.3+PostgreSQL9.3 on Mac の環境を構築する (上の続き)  

- http://shin1x1.github.io/vagrantx/  
  > the Vagrant GUI client for Mac OS X  
  
//--- End of File ---
