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

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    check_exit_status
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    check_exit_status

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source .bashrc # Not sure about this line
    check_exit_status

    ~/.rbenv/bin/rbenv install 3.3.1
    check_exit_status

    ~/.rbenv/bin/rbenv  global 3.3.1
    check_exit_status
    

    echo "Instalando rails"
    gem install rails
    check_exit_status
    ~/.rbenv/bin/rbenv  rehash
    check_exit_status

    cd -
}

full_installation(){
    echo "No esta terminado"
    exit 1
    basic_installation
    # configuración servicio http
    rails new ruby_api --api
    echo "gem 'rack-cors'" >> ruby_api/Gemfile
    bundle install --path ruby_api


    # copiar configuración + clases
    cp ruby_conf/cors.rb ruby_api/config/initializers/cors.rb
    cp ruby_conf/routes.rb ruby_api/config/routes.rb

    # Base de datos (Pendiente)
    #Esto creará un archivo de migración en db/migrate y un archivo de modelo en app/models.
    rails generate model Personaje nombre:string raza:string clase:string data:json

    rails g model Tarea descripcion:string completada:boolean usuario:string
    rails db:migrate
    rails g controller Tareas

}

if [ "$1" = "--basic" ]; then
    basic_installation
elif [ "$1" = "--full" ]; then
    echo "Hola mundo"
else
    echo "Use: $0 [--basic | --full]"
    exit 1
fi
echo "fin de la historia"