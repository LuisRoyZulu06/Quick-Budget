defmodule QuickBudget.NotificationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `QuickBudget.Notifications` context.
  """

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        attempts: "some attempts",
        mail_body: "some mail_body",
        recipient_email: "some recipient_email",
        sender_email: "some sender_email",
        sender_name: "some sender_name",
        status: "some status",
        subject: "some subject"
      })
      |> QuickBudget.Notifications.create_email()

    email
  end

  @doc """
  Generate a sms.
  """
  def sms_fixture(attrs \\ %{}) do
    {:ok, sms} =
      attrs
      |> Enum.into(%{
        date_sent: "some date_sent",
        mobile: "some mobile",
        msg_count: "some msg_count",
        sms: "some sms",
        status: "some status",
        type: "some type"
      })
      |> QuickBudget.Notifications.create_sms()

    sms
  end
end
