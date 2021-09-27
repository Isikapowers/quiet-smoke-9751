class AppointmentsController < ApplicationController
  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy

    redirect_to doctor_path(appointment.doctor)
  end
end
