#!/bin/bash
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: last comamnd failed. Aborting..."
        exit 1
    fi
}

basic_installation() {
    cd $HOME
    sudo apt update -y
    sudo apt install -y git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev 
    check_exit_status


    if [ -d "$HOME/.rbenv" ]; then
        rm -rf $HOME/.rbenv
        check_exit_status
    fi

    git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
    check_exit_status
    git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
    check_exit_status

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source .bashrc # Not sure about this line
    check_exit_status

    $HOME/.rbenv/bin/rbenv install 3.3.1
    check_exit_status

    $HOME/.rbenv/bin/rbenv  global 3.3.1
    check_exit_status
    

    echo "Instalando rails"
    gem install rails
    check_exit_status
    $HOME/.rbenv/bin/rbenv  rehash
    check_exit_status

    cd -
}

full_installation(){
    echo "No esta terminado"
    #exit 1
    basic_installation
    # configuración servicio http
    rails new ruby_api --api
    echo "gem 'rack-cors'" >> ruby_api/Gemfile
    cd ruby_api
    bundle install


    # Base de datos 
    #Esto creará un archivo de migración en db/migrate y un archivo de modelo en app/models.
    rails generate model Personaje nombre:string raza:string clase:string primAttr:json secAttr:json
    #Guardar los datos (?)
    rails db:migrate
    #Generar plantilla, aunque realmente se  copiara de ruby_conf/personajes_controller.rb
    rails generate controller PersonajesController
    
    
    cd -
    # copiar Cors + Routes
    cp ruby_conf/cors.rb ruby_api/config/initializers/cors.rb
    cp ruby_conf/routes.rb ruby_api/config/routes.rb
    cp ruby_conf/personajes_controller.rb ruby_api/app/controllers/personajes_controller.rb
}



full_installation(){
    basic_installation

    # configuración servicio http
    rails new ruby_api --api
    echo "gem 'rack-cors'" >> ruby_api/Gemfile
    cd ruby_api
    bundle install


    # Base de datos 
    #Esto creará un archivo de migración en db/migrate y un archivo de modelo en app/models.
    rails generate model Personaje nombre:string raza:string clase:string primAttr:json secAttr:json
    #Guardar los datos (?)
    rails db:migrate
    #Generar plantilla, aunque realmente se  copiara de ruby_conf/personajes_controller.rb
    rails generate controller PersonajesController
    
    
    cd -
    # copiar Cors + Routes
    cp ruby_conf/cors.rb ruby_api/config/initializers/cors.rb
    cp ruby_conf/routes.rb ruby_api/config/routes.rb
    cp ruby_conf/personajes_controller.rb ruby_api/app/controllers/personajes_controller.rb

   

}

if [ "$1" = "--basic" ]; then
    basic_installation
elif [ "$1" = "--full" ]; then
    full_installation
else
    echo "Use: $0 [--basic | --full]"
    exit 1
fi

check_exit_status
 echo "Si todo ha ido bien podrá inicar el servidor desde la carpeta ruby_api lanzando el comando rails server"
echo "done"