require_relative 'patient'
require_relative 'room'
require_relative 'patient_repository'
require_relative 'room_repository'
require_relative 'controller'
require_relative 'view'
require_relative 'router'

patients_csv_file = File.join(__dir__, './patients.csv')
rooms_csv_file = File.join(__dir__, './rooms.csv')
patient_repository = PatientRepository.new(patients_csv_file)
room_repository = RoomRepository.new(rooms_csv_file)
controller_patient = ControllerPatient.new(patient_repository)
controller_room = ControllerRoom.new(room_repository)

router = Router.new(controller_patient, controller_room)

router.run
