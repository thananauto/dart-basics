

class Vehicle{

  String modelName;

  String modelCompany;

  int modelNumber;

   Vehicle([this.modelName, this.modelCompany='Audi', this.modelNumber])
            : assert(modelName != null);

}

void main(){

  Vehicle vehicle= Vehicle('thanan');
print(vehicle.modelName);
print(vehicle.modelCompany);

}